import 'dart:convert';


import 'package:ctt_mobile/services/auth_service.dart';

import '../main.dart';

class HoursService {
  final authService = getIt.get<AuthService>();

  Future<dynamic> getHours() async {
    print('Fetching hours!');
    final response = await http.get('/companies/${authService.user.companyId}/users/${authService.user.id}/hours');
    return response.data;
  }
}

final hoursService = HoursService();
