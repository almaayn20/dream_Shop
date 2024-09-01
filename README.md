## Dream Shop App

This Flutter-based eCommerce app provides a seamless shopping experience with a focus on clean architecture, best practices, and elegant design. It supports all the essential eCommerce operations, including product retrieval, cart management, and checkout. The app integrates various features and technologies to deliver a robust solution.

<pre>
<img src="assets/mockup.jpg">
</pre>

**Note:** Due to API restrictions, the **Create Account** feature is not available. You can log in using the provided stored account credentials, which are displayed on the login screen.

**Note:** Due to API restrictions, the API does not store new orders. Instead, it returns the same object that was sent.

### Key Features

- **Product and Category Management**
  - Retrieve and display products with detailed information.
  - Organize products by categories for easy navigation.

- **Shopping Cart & Secure Checkout**
  - Add products to the cart.
  - Complete purchases through a smooth checkout process.
  - Integrate with Stripe for secure payments.

- **Order Tracking**
  - Track the status of orders.
  - View user order history for easy reference.

- **Maps Integration**
  - Get User's Location and Geocoding it using Google Maps and geocoding.
  - User Can Select location using Google Maps.
  -  
- **Localization Support**
  - Multi-language support is implemented, pending string extraction.

### Technologies Implemented

- **Flutter**: Framework used to build the entire application.
- **GetX**: For efficient state management and responsive UI updates.
- **Hive**: Local database for storing user data and preferences.
- **Dio**: Network library for making API requests and handling responses.
- **Shimmer**: Used to display loading placeholders during data fetch.
- **ScreenUtil**: Ensures responsive design across different screen sizes.
- **Stripe**: Integrated payment processing for secure transactions.
- **Google Maps API**: For displaying and interacting with maps within the app.
- **Clean Architecture**: Ensures maintainable, scalable, and organized code structure.
- **Localization**: Implemented for supporting multiple languages, pending full string extraction.
- **and much more**
  
### Architecture & Code Quality

The app uses clean architecture principles, emphasizing separation of concerns and maintainability. Following best practices in clean code, the project is well-structured and easy to navigate, making it easy to extend and maintain.

### Download Apk
You can download and install the latest build of the app from the link below:
Download the Latest Build: [Click here](https://drive.google.com/file/d/1ViQP2pJyOIzBSvIGJ9dOZpagl_zQFuc0/view?usp=sharing)

### Getting Started

This is a normal flutter app. You should follow the instructions in the official documentation. this Project uses fake store API :https://fakestoreapi.com/
