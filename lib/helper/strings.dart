import 'dart:ui';

import 'package:intl/intl.dart';

import 'api_urls.dart';

class Strings{


  static const app_name  = 'PES Electrical Online';
  static const bill_link  = 'http://www.pesonline.co.in/PdfGenerator/BillPrinting.aspx?';

  static const token_parameter_name  = 'login_token';
  static const paytm_link  = 'https://paytm.com/electricity-bill-payment';
  static const website_url  = 'http://www.peselectrical.org/';

  static String formatDateNew(String date){
    print("Checking date --- ${date}");
    final DateFormat oldDateFormat = DateFormat('dd/MM/yyyy');
    final DateFormat newDateFormat = DateFormat('MMM yy');
    final DateTime oldDate =oldDateFormat.parse(date);
    final String formattedDate = newDateFormat.format(oldDate);
    return formattedDate.toUpperCase();
  }



}