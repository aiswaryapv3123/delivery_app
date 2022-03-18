import 'dart:convert';

import 'package:delivery_app/src/models/get_notifications.dart';
import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:delivery_app/src/models/login_request.dart';
import 'package:delivery_app/src/models/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryRepo {
  final _provider = DeliveryServices();

  Future<GetNotifications> fetchNotifications() {
    return _provider.getNotifications();
  }

  Future<GetOrderList> fetchOrderList() {
    // TODO: implement getOrderList
    return _provider.getOrderList();
  }
}

class DeliveryServices {
  final client = http.Client();
  Future<GetOrderList> getOrderList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print("Token  " + token.toString());
    final queryParameters = {
      'api_token': token,
      "with":"driver;productOrders;productOrders.product;productOrders.options;orderStatus;deliveryAddress;payment",
      "searchFields":"driver.id:=;order_status_id:<>;delivery_address_id:<>",
      "searchJoin":"and",
      "orderBy":"id",
      "sortedBy":"desc"
    };
    final uri =
        Uri.https("gapp.tupperwareoutlet.com", '/api/orders', queryParameters);
    final response = await client.get(uri);
    print("Order api Response");
    print(response.body);
    final data = jsonDecode(response.body);
    GetOrderList orderList = GetOrderList.fromJson(data);
    print("Order Data ID");
    print(orderList.data![0].id);
    return orderList;
  }

  Future<GetNotifications> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    print("Token  " + token.toString());
    final queryParameters = {
      'api_token': token,
      "search":"notifiable_id:10",
      "searchFields":"notifiable_id:=",
      "orderBy":"created_at",
      "sortedBy":"desc",
      "limit":"10"
    };
    final uri =
    Uri.https("gapp.tupperwareoutlet.com", '/api/notifications', queryParameters);
    final response = await client.get(uri);
    print("Notifications api Response");
    print(response.body);
    final data = jsonDecode(response.body);
    GetNotifications notifications = GetNotifications.fromJson(data);
    print("Notifications");
    print(notifications.data![0].data);
    return notifications;
  }
}
