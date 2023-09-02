import 'dart:developer';

import 'package:mobx/mobx.dart';

part 'supabase_service.g.dart';

class SupabaseService = _SupabaseService with _$SupabaseService;

abstract class _SupabaseService with Store{
  @observable
  bool isLoading = false;

  @action
  void setLoading(bool res){
    isLoading = res;
  }
}