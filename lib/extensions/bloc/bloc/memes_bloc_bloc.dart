import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'memes_bloc_event.dart';
part 'memes_bloc_state.dart';

class MemesBloc extends Bloc<MemesBlocEvent, MemesBlocState> {
  MemesBloc() : super(BlocInitial()) {
    on<BlocLoadData>((event, emit) async {
      /*  emit(BlocInitial()); */
      final response = await http.get(
        Uri.parse(
            'https://discord.com/api/v9/channels/1191785265228939344/messages'),
        headers: {
          'Authorization':
              'MjI4ODY3ODkwNjA5MjU4NTA2.GIJbRz.dHb1rb9UYU22Ez97flpw99ue1kI3Sp7h-ppjYM',
        },
      );

      if (response.statusCode == 200) {
        var listOfMessages = json.decode(response.body);

        /* for (Map<String, dynamic> message in listOfMessages) {
            List<dynamic> attachments = message["attachments"];
            List<dynamic> embeds = message["embeds"];
          if (attachments.isNotEmpty) {
            /* for (List<Map<String, dynamic>> oldMessages
              in firestoreList.data()!["memelist"]) {
            oldMessages.firstWhere((element) {
              if (message["author"]["username"] == element["username"]) {
                return false;
              } else {
                return true;
              }
            });
          } */
          print(message["id"]);
            
             if (message["attachments"][0]["url"] != null ) {
                FirebaseFirestore.instance
                .collection("memes")
                .doc("erlbNt5BSosr7Y5w9mw0")
                .update({
              "memelist": FieldValue.arrayUnion([
                {
                  "messageid": message["id"],
                    "url": attachments[0]["url"],  
                  "username": message["author"]["username"],
                }
              ]),
            });
              } 
          } 
          /* else if (embeds.isNotEmpty) {
            /* for (List<Map<String, dynamic>> oldMessages
              in firestoreList.data()!["memelist"]) {
            oldMessages.firstWhere((element) {
              if (message["author"]["username"] == element["username"]) {
                return false;
              } else {
                return true;
              }
            });
          } */
            if (embeds[0]["image"]["url"] != null ||
                embeds[0]["image"] != null ||
                embeds[0] != null) {
              FirebaseFirestore.instance
                  .collection("memes")
                  .doc("erlbNt5BSosr7Y5w9mw0")
                  .update({
                "memelist": FieldValue.arrayUnion([
                  {
                    "messageid": message["id"],
                   /*  "url": embeds[0]["image"]["url"], */
                    "username": message["author"]["username"],
                  }
                ]),
              });
            }
          } */
        } */
        DocumentSnapshot<Map<String, dynamic>> list = await FirebaseFirestore
            .instance
            .collection("memes")
            .doc("erlbNt5BSosr7Y5w9mw0")
            .get();
        List<dynamic> newlist = list.data()!["memelist"];
        emit(BlocDataLoaded(newlist));
      } else {
        throw Exception('Discord kanalından mesajlar alınamadı bb');
      }
      try {} catch (e) {
        print("$e aa");
      }
    });
  }
}
