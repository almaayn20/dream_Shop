import 'package:foody/core/hive_boxes/auth_box.dart';

class ApiConstants {
  static Map<String, String> getHeaders() {
    return {
      'Accept': 'application/json',
      'xx-token':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWRQZXJzb24iOjEsImlhdCI6MTcyMjYyOTc5MSwiZXhwIjoxNzMyOTk3NzkxfQ.qgzcznIyuN9vLDe1B7R9ejM14P5GjcKcgRQUwa70UW4'
      //AuthBox.getAuthToken()!,
    };
  }

  static const String endPointUrl = "http://192.168.1.106:7070/api";
  static const String baseUrl = "http://192.168.1.106:7070";

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///=========================================   Auth Urls ===============================================
/////////////////////////////////////////////////////////////////////////////////////////////////////////
  static String loginEmailId = "/login-email-id";
  static String renewTokenLogin = "/renew-token-login";

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///=========================================   Category Urls ===============================================
/////////////////////////////////////////////////////////////////////////////////////////////////////////
  static String addCategories = "/add-categories";
  static String getAllCategories = "/get-all-categories";

  static String deleteCategory(String categoryUid) =>
      '/delete-category/$categoryUid';

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///=========================================   delivery Urls ===============================================
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  static String getAllDelivery = "/get-all-delivery";
  static String getOrdersForDelivery(String orderStatus) =>
      '/get-all-orders-by-delivery/$orderStatus';
  static String addNewOrders = "/add-new-orders";
  static String getOrdersByStatus(String status) =>
      '/get-orders-by-status/$status';

  static String getOrderDetailsById(String orderId) =>
      '/get-details-order-by-id/$orderId';
  static String updateStatusOrderToDispatched =
      "/update-status-order-dispatched";
  //   body: {'idDelivery' , 'idOrder'}

  static String updateOrderStatusOnWay(String orderId) =>
      '/update-status-order-on-way/$orderId';
  //   body: {'latitude' ,'longitude' }

  static String updateOrderStatusDelivered(String orderId) =>
      '/update-status-order-delivered/$orderId';

  static String getListOrdersForClient = "/get-list-orders-for-client";

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///=========================================   product Urls ===============================================
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  static String addNewProduct = "/add-new-products";
  static String getProductsTopHome = "/get-products-top-home";
  static String getImagesProducts(String id) => '/get-images-products/$id';
  static String searchProductsForName(String productName) =>
      '/search-product-for-name/$productName';
  static String searchPorductsForCategory(String categoryId) =>
      '/search-product-for-category/$categoryId';
  static String listProductsAdmin = "/list-porducts-admin";
  static String updateStatusProduct = "/update-status-product";
  // body: {'idProduct' : idProduct,'status' : status}

  static String deleteProduct(String productId) => '/delete-product/$productId';

/////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///=========================================   User Urls ===============================================
/////////////////////////////////////////////////////////////////////////////////////////////////////////

  static String getUserById = "/get-user-by-id";
  static String editProfile = "/edit-profile";
// body: {'firstname' : name,'lastname' : lastname,'phone': phone}
  static String getUserUpdated = "/get-user-updated";
  static String changePassword = "/change-password";
// body: {'currentPassword' ,'newPassword' }
  static String changeImageProfile = "/change-image-profile";
// body :{image}
  static String registerDelivery = "/register-delivery";
  static String registerClient = "/register-client";
  static String getAddresses = "/get-addresses";

  static String deleteStreetAddress(String addressId) =>
      '/delete-street-address/$addressId';
  static String addNewAddressLocation = "/add-new-address";
// body: {'street'    : street, 'reference' : reference, 'latitude'  : latitude,'longitude' : longitude}
  static String getAddressOne = "/get-address";
  static String updateNotificationToken = "/update-notification-token";
// body: {'nToken' : nToken}
  static String getAdminsNotificationToken = "/get-admins-notification-token";
  static String updateDeliveryToClient(String personId) =>
      '/update-delivery-to-client/$personId';
}
