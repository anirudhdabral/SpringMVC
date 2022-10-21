package database;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Tshirts {
	public Tshirts() {
		super();
	}

	@Id
	@Column(length = 50)
	private String id;

	@Column(length = 50)
	private String name;

	@Column(length = 10)
	private String color;

	@Column(length = 6)
	private String gender;

	@Column(length = 6)
	private String size;

	private double price;
	private double rating;

	@Column(length = 6)
	private String avail;

	public Tshirts(String id, String name, String color, String gender, String size, double price, double rating,
			String avail) {
		this.id = id;
		this.name = name;
		this.color = color;
		this.gender = gender;
		this.size = size;
		this.price = price;
		this.rating = rating;
		this.avail = avail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getRating() {
		return rating;
	}

	public void setRating(Double rating) {
		this.rating = rating;
	}

	public String getAvail() {
		return avail;
	}

	public void setAvail(String avail) {
		this.avail = avail;
	}

	@Override
	public String toString() {
		return "\nID:" + this.id + "\nName:" + this.name + ", Color:" + this.color + ", Gender:" + this.gender
				+ ", Size:" + this.size + ", Price:" + this.price + ", Rating:" + this.rating + ", Avail:" + this.avail;
	}
}
