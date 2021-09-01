package com.test.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.test.model.User;
import com.test.service.UserService;

@RestController
@RequestMapping("/users")
public class UserController {

	@Autowired
	@Qualifier("userService")
	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/getAllUsers")
	public List<User> getUsers() {
		List<User> listOfUsers = userService.getAllUsers();
		return listOfUsers;
	}

	@GetMapping("/getUser")
	@ResponseBody
	public User getUserById(@RequestParam int id) {
		System.out.println(id);
		return userService.getUser(id);
	}

	@PostMapping("/addUser")
	public User addUser(@RequestBody User user) {
		return userService.addUser(user);
	}

	@PutMapping("/updateUser/{id}")
	public User updateUser(@PathVariable int id, @RequestBody User user) {
		return userService.updateUser(id, user);
	}

	@DeleteMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable("id") int id) {
		userService.deleteUser(id);
		return "deleted";
	}

	@GetMapping("/getAllUsersPage")
	public ModelAndView importArticle() {
		List<User> listOfUsers = userService.getAllUsers();
		ModelAndView modelView = new ModelAndView("/index");
		modelView.addObject("users", listOfUsers);
		return modelView;
	}

	@GetMapping("/getUserById")
	public ModelAndView getUser(@RequestParam int id) {
		User user = userService.getUser(id);
		ModelAndView modelView = new ModelAndView("/getbyid");
		modelView.addObject("user", user);
		return modelView;
	}

	@GetMapping("/deleteUserById")
	public String deleteUserById(@ModelAttribute("id") User user) {
		userService.deleteUser(user.getId());
		// modelView.addObject("user", user);
		return "Deleted Successfully ";
	}

	@GetMapping("/sampledel")
	public ModelAndView deleteUser() {
		ModelAndView modelView = new ModelAndView("/deletebyid");
		return modelView;
	}

	@GetMapping("/getUser1")
	public ModelAndView getUser() {
		ModelAndView modelView = new ModelAndView("/getUser");
		return modelView;
	}

	@GetMapping("/getUserById1")
	public ModelAndView GetUserById(@ModelAttribute("id") User user) {
		User getUser = userService.getUser(user.getId());
		ModelAndView modelView = new ModelAndView("/getbyid");
		modelView.addObject("user", getUser);
		System.out.println(getUser);
		return modelView;
	}
	
	@GetMapping("/user")
	public ModelAndView getIndexPage() {
		ModelAndView modelView = new ModelAndView("/sample");
		return modelView;
    }
	
	@GetMapping("/getUserDemo")
	public List<User> getUserDemo() {
		List<User> listOfUsers = userService.getAllUsers();
		return listOfUsers;
	}
     
}
