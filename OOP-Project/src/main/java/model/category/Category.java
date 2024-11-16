package model.category;

public class Category {

	// Encapsulation: The fields are private to restrict direct access from outside the class.
	private	int id;  
	private	String name;
	private	String discription;  // Note: Correct the spelling to 'description' for consistency.
	
	// Constructor Overloading: Multiple constructors to initialize objects with different sets of data.
	// Constructor 1: Initializes Category with name and description.
	public Category(String name, String discription) {
		this.name = name;
		this.discription = discription;
	}

	/**
	 * Constructor 2: Initializes Category with id, name, and description.
	 * Demonstrates constructor overloading, which allows flexibility in object creation.
	 */
	public Category(int id, String name, String discription) {
		// Calling the superclass constructor (though not strictly necessary here since no parent class)
		super();
		this.id = id;
		this.name = name;
		this.discription = discription;		
	}
	
	// Default constructor: Allows creation of a Category object without setting initial values.
	public Category() {
	}

	// Encapsulation: Getter and setter methods provide controlled access to private fields.
	// Getter for id field (Encapsulation: Provides indirect access to the private field)
	public int getId() {
		return id;
	}

	// Setter for id field (Encapsulation: Provides controlled modification of private field)
	public void setId(int id) {
		this.id = id;
	}
	
	// Getter for name field (Encapsulation)
	public String getName() {
		return name;
	}

	// Setter for name field (Encapsulation)
	public void setName(String name) {
		this.name = name;
	}

	// Getter for description field (Encapsulation)
	public String getDiscription() {
		return discription;
	}

	// Setter for description field (Encapsulation)
	public void setDiscription(String discription) {
		this.discription = discription;
	}
}
