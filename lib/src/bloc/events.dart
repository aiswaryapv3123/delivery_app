import 'package:equatable/equatable.dart';

abstract class DeliveryEvents extends Equatable {
  const DeliveryEvents();

  @override
  List<Object> get props => [];
}

class GetOrderListData extends DeliveryEvents {}


class GetNotificationsData extends DeliveryEvents {}


class GetOrderHistoryData extends DeliveryEvents {}


class GetRecentOrderData extends DeliveryEvents {}
