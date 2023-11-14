package ph.com.qkc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ph.com.qkc.model.User;
import ph.com.qkc.repository.UserAuthRepository;
import ph.com.qkc.service.UserAuthService;


@Service
public class UserAuthServiceImpl implements UserAuthService{

	@Autowired
	private UserAuthRepository userAuthRepo;
	
	@Override	
	public User authenticate(User user) {
		
		User dbUser = userAuthRepo.findByUsername(user.getUsername());
		
		if(dbUser != null) {
			if(dbUser.getPassword().equals(user.getPassword())) {
				User userSession = new User();
				userSession.setUser_id(dbUser.getUser_id());
				userSession.setUsername(dbUser.getUsername());
				userSession.setName(dbUser.getName());
				userSession.setBranch(dbUser.getBranch());
				return userSession;
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

}