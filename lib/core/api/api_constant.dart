class ApiConstant {
  static const String baseUrl = "https://ecommerce.routemisr.com/api/v1";
  static const String login = "/auth/signin";
  static const String signup = "/auth/signup";
  static const String forgotPassword = "/auth/forgotPasswords";
  static const String resetPassword = "/auth/verifyResetCode";
  static const String getAllCategories = "/categories";
  static String getSpecificCategory(catId) => "/categories/$catId";
  static String getAllSubCategory(catId) => "/categories/$catId/subcategories";
  static const String getAllBrands = "/brands";
  static String getSpecificBrand (String brandId) => "/brands/$brandId";
  static const String getAllProducts = "/products";
  static String getSpecificProducts(String productId) => "/products/$productId";
  static const String getAllOrders = "/orders";
  static String getUserOrders(String userId) => "/orders/user/$userId";
  static String createUserOrders(String orderId) => "/orders/user/$orderId";

}
