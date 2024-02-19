
import 'package:assignment/api_provider/dio_api_provider.dart';
import 'package:assignment/constants/constants.dart';
import 'package:assignment/modules/renewal_tickets_view/renewal_tickets_constants/renewal_tickets_endpoints.dart';
import 'package:flutter/material.dart';

class RenewalTicketsApiProvider{

  Future<dynamic> getRenewalTickets({
    Map<String,dynamic>? params,}) async {

    var data ;
    data = await DioApiProvider().getApiCalls(
        urlString: "${Constants.baseUrl}${RenewalTicketsEndpoints().getRenewalTickets}",
        params: params,
    );
    return data;
  }

}