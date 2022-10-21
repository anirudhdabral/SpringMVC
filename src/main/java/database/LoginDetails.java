package database;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class LoginDetails {
	@Id
	@Column(length = 20)
	private String username;

	@Column(length = 50)
	private String password;

	public LoginDetails() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public LoginDetails(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

}
