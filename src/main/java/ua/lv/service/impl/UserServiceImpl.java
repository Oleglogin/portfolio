package ua.lv.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.lv.dao.UserDAO;
import ua.lv.entity.User;
import ua.lv.service.UserService;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService, UserDetailsService{

    @Autowired
    UserDAO userDAO;

    @Autowired
    PasswordEncoder passwordEncoder;


    public void save(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userDAO.save(user);
    }

    public User getUserById(int id) {
        return userDAO.findOne(id);
    }

     public void delete(int id) {
        userDAO.delete(id);
    }

    public List<User> listUsers() {
        return userDAO.findAll();
    }

    public User findByUserName(String username) {
        return userDAO.findByUserName(username);
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return findByUserName(username);
    }

    public int AllUsers() {
        return userDAO.findAllUsers();
    }
}
