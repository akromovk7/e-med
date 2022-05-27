import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_app/core/constants/color_const.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModel;
  final Widget Function(BuildContext context, T value)? OnPageBuilder;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const  BaseView({
    Key? key, required this.viewModel, required this.OnPageBuilder, this.onModelReady, this.onDispose,
  }) :super(key: key);



  @override
  State<BaseView> createState()=> _BaseViewState();



}

  class _BaseViewState extends State<BaseView> {
    // ignore: prefer_typing_uninitialized_variables
    var subscription;
    // ignore: prefer_typing_uninitialized_variables
    var internetStatus;

    @override
    void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result){
      setState((){
        internetStatus = result;
      });

    });
    if(widget.onModelReady != null)widget.onModelReady!(widget.viewModel);
  }
  @override
  Widget build(BuildContext context) {
    return internetStatus == ConnectivityResult.none ? 
      Scaffold(body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset("assets/lottie/lost_connection.json"),
                  Text(
                    "Oops!",
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 25,
                        color: ConsColors.kBlack),
                  ),
                  const Text(
                    "There is no Internet connection\nPlease check your Internet connection",
                    style: TextStyle(
                      fontFamily: 'ManropeLight',
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),)
    : widget.OnPageBuilder!(context, widget.viewModel);
  }
  
  @override
  void dispose() {
    super.dispose();
    if(widget.onDispose != null) widget.onDispose!();
  }
  }