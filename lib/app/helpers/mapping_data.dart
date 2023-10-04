import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../firebase/firebase_remote_config.dart';

class MappingData{

  List<Widget> serverData = [];

  mapData(serverData)
  {
    for(var elements in jsonDecode(serverData))
      {
        serverData.add(elements);
      }
    return serverData;
  }

}