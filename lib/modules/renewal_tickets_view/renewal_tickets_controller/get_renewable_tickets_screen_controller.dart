import 'dart:async';

import 'package:assignment/modules/renewal_tickets_view/renewal_tickets_api_provider/renewal_tickets_api_provider.dart';
import 'package:assignment/modules/renewal_tickets_view/renewal_tickets_models/renewal_ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetRenewableTicketsScreenController extends GetxController{

  @override
  void onInit(){
    // Get called when controller is created
    super.onInit();

    getBatchesByAcademyId(page: page,size: size,userId: userId );
    scrollController.addListener(scrollListener);

  }

  @override
  void onReady(){
    // Get called after widget is rendered on the screen
    super.onReady();
  }

  RxBool loading = false.obs;
  RxInt totalItems = 0.obs;
  int page = 0;
  int size = 20;
  int userId = 489;

  toggleLoading(){
    loading.value = !loading.value;
  }

  List<Ticket> renewableTicketList = [];
  final scrollController = ScrollController();
  RxBool isListLoading = false.obs;



  Future< void> scrollListener() async{
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent){
        isListLoading.value = true;
      page = page + 1 ;
      await getBatchesByAcademyId(userId: userId,size: size,page: page);
      Future.delayed(Duration(seconds: 3), () async{
        // setState(() {
          isListLoading.value = false;
        // });
      });
    }
  }

  Map<String, Color> colorMap = {
    'Grace Period' : Colors.blue,
    'Missed Service' : Colors.red,
  };


  getBatchesByAcademyId({required int size,required int page,required int userId,}) async {
    if(!isListLoading.value){
      toggleLoading();
    }

    var value = await RenewalTicketsApiProvider().getRenewalTickets(params: {

      'userid' : userId.toString(),
      'size' : size.toString(),
      'page' : page.toString(),

    });


    // log(value.toString());
    totalItems.value = value['totalItems'];
    for( var ticket in value['data']){
      renewableTicketList.add(Ticket.fromJson(ticket));
    }

    if(!isListLoading.value){
      toggleLoading();
    }
  }



  @override
  void onClose(){
    //Get called when controller is removed from memory
    super.onClose();
  }


}

