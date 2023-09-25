import 'app_config.dart';

///* This contains all names to the endpoints
/// used in our app
///
// base url
const baseUrl = AppConfig.apiBaseUrl;

// login
const loginEndPoint = "$baseUrl/users/login";

// register
const registerEndPoint = "$baseUrl/users/register";

// crop variety
const cropVarietyEndPoint = "$baseUrl/crops";

// garden model
const gardensEndPoint = "gardens";

// products
const productsEndPoint = "products";

// complete profile registration endpoint
const completeProfileEndPoint = "registration";