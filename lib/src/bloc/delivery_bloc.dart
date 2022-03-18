
import 'dart:io';

import 'package:delivery_app/src/api/services.dart';
import 'package:delivery_app/src/bloc/events.dart';
import 'package:delivery_app/src/bloc/states.dart';
import 'package:delivery_app/src/models/get_orderlist_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryBloc extends Bloc<DeliveryEvents, DeliveryStates> {
  DeliveryBloc() : super(OrderInitialState()) {

    final DeliveryRepo deliveryRepo = DeliveryRepo();
    /// orderlist
    on<GetOrderListData>((event, emit) async {
      try {
        emit(OrderLoadingState());
        final data = await deliveryRepo.fetchOrderList();
        emit(OrderLoadedState(getOrderList: data));
      } on SocketException {
        emit(OrderErrorState(error: "No internet"));
      } on HttpException {
        emit(OrderErrorState(
          error: 'No Service Found',
        ));
      } on FormatException {
        emit(OrderErrorState(
          error: 'Invalid Response format',
        ));
      } catch (e) {
        print("Error "+ e.toString());
        emit(OrderErrorState(
          error: 'Unknown Error',
        ));
      }
    });

    /// notifications
    on<GetNotificationsData>((event, emit) async {
      try {
        emit(NotificationsLoadingState());
        final data = await deliveryRepo.fetchNotifications();
        emit(NotificationsLoadedState(getNotifications: data));
      } on SocketException {
        emit(NotificationsErrorState(error: "No internet"));
      } on HttpException {
        emit(NotificationsErrorState(
          error: 'No Service Found',
        ));
      } on FormatException {
        emit(NotificationsErrorState(
          error: 'Invalid Response format',
        ));
      } catch (e) {
        print("Error "+ e.toString());
        emit(NotificationsErrorState(
          error: 'Unknown Error',
        ));
      }
    });
  }
}