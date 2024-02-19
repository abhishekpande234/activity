import 'package:assignment/constants/constants.dart';
import 'package:assignment/modules/renewal_tickets_view/renewal_tickets_controller/get_renewable_tickets_screen_controller.dart';
import 'package:assignment/modules/renewal_tickets_view/renewal_tickets_widgets/renewal_ticket_card_widget.dart';
import 'package:assignment/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class GetRenewableTicketsScreen extends GetView<GetRenewableTicketsScreenController> {
  const GetRenewableTicketsScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    Get.put(GetRenewableTicketsScreenController());
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: customTextWidget(context, data: 'Renewal Tickets', textColor: Colors.white, fontSize: Constants.headingFontSize, fontWeight: FontWeight.normal),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Wrap(
                children: [
                  Flexible(
                      child:  customTextWidget(context, data: 'Total Tickets found- ', textColor: Colors.blue, fontSize: Constants.headingFontSize, fontWeight: FontWeight.bold)),
                  Flexible(
                      child: Obx(() => customTextWidget(context, data: controller.loading.value ? '' : '${controller.totalItems.value}' , textColor: Colors.blue, fontSize: Constants.headingFontSize, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            Obx(() => Expanded(
                child: controller.loading.value
                        ? Container(
                          child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Center(child: CircularProgressIndicator())
                      ],
                    ),
                        )
                    :  ListView.builder(

                    itemCount: controller.isListLoading.value ? controller.renewableTicketList.length + 1 : controller.renewableTicketList.length,
                    controller: controller.scrollController,
                    itemBuilder: (context , int index){

                      return index < controller.renewableTicketList.length
                          ? renewalTicketCardWidget(
                          context: context,
                          ticket: controller.renewableTicketList[index],
                          colorMap: controller.colorMap
                      )
                          : Center(child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: CircularProgressIndicator(color:Theme.of(context)
                            .textTheme
                            .headline1!
                            .color!),
                      ),);
                    })
            )),


          ],
        ),

      ),//
    );
  }
}

