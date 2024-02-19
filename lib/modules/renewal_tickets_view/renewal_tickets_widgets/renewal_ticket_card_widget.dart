import 'package:assignment/constants/constants.dart';
import 'package:assignment/modules/renewal_tickets_view/renewal_tickets_models/renewal_ticket_model.dart';
import 'package:assignment/theme/theme_provider.dart';
import 'package:assignment/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

Widget renewalTicketCardWidget({required BuildContext context,required Ticket ticket,
  required Map<String, Color> colorMap
}) => Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Card(
    elevation: 8,
    color: Colors.white,

    child: Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Container(

          width: double.infinity,

          color: Colors.blueAccent,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: customTextWidget(context, data: ticket.title, textColor: ThemeProvider.skyLightest, fontSize: Constants.textFontSize, fontWeight: FontWeight.normal),
          ),

        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customTextWidget(context, data: '${ticket.customer.firstName} ${ticket.customer.lastName}', textColor: ThemeProvider.darkTextColor, fontSize: Constants.textFontSize, fontWeight: FontWeight.normal),
              customTextWidget(context, data: ticket.ticketno, textColor: ThemeProvider.darkTextColor, fontSize: Constants.textFontSize, fontWeight: FontWeight.normal)
            ],
          ),
        ),

        Divider(color: ThemeProvider.darkTextColor.withOpacity(0.5),thickness: 1,),

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: customTextWidget(context, data: '${ticket.ticketdate} ', textColor: ThemeProvider.darkTextColor, fontSize: Constants.textFontSize, fontWeight: FontWeight.normal)),
              Flexible(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(int.parse(ticket.color)))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: customTextWidget(context, data: ticket.statusSelect, textColor: Color(int.parse(ticket.color)), fontSize: Constants.textFontSize, fontWeight: FontWeight.normal),
                    )),
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amberAccent
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: customTextWidget(context, data: ticket.category, textColor: ThemeProvider.darkTextColor, fontSize: Constants.textFontSize, fontWeight: FontWeight.normal),
              )),
        ),

        Wrap(
          children: ticket.customer.privateTag.split(',').map((value) {

            return value != '' ? Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorMap[value] ?? Colors.red
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: customTextWidget(context, data: value, textColor: ThemeProvider.darkTextColor, fontSize: Constants.textFontSize, fontWeight: FontWeight.normal),
                  )),
            ) : const SizedBox();

          }).toList()
        ),

       const SizedBox(height: 5,),



      ],

    ),

  ),
);