import 'package:house_of_electricity/src/core/app/di.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future initializeApp() async {
  //init supabase
  await Supabase.initialize(
    url: 'https://kfqbixcnmrcoaxaldlgl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtmcWJpeGNubXJjb2F4YWxkbGdsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU2OTUyMDYsImV4cCI6MjA3MTI3MTIwNn0.t5cxunyoeQogGqQzPGJucs5-9D0n6x_NNjbyhK9HkH8',
  );
  //init di
  initDi();
}
