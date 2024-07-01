import 'package:flutter/cupertino.dart';

///[Loading] class is used for showing and hiding loading
///Please implement [ShowLoading] & [HideLoading] execute function
///according to your project specification

sealed class Loading {
  const Loading();

  factory Loading.show({
    required BuildContext context,
    String message,
  }) = ShowLoading;

  factory Loading.hide(BuildContext context) = HideLoading;

  void execute();
}

class ShowLoading extends Loading {
  final BuildContext context;
  String message;

  ShowLoading({
    required this.context,
    this.message = "Loading...",
  });
  @override
  void execute() {
    throw UnimplementedError();
  }
}

class HideLoading extends Loading {
  final BuildContext context;
  HideLoading(this.context);
  @override
  void execute() {
    throw UnimplementedError();
  }
}
