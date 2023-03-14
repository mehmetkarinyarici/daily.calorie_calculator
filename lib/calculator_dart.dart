import 'package:kalori_hesapla/user_data.dart';

class Calculator {
  UserData userData;
  Calculator(this.userData);

  calorieCalculator() {
    late double bmhSonuc;
    late double calSonuc;

    if (userData.currentButton == 'ERKEK') {
      bmhSonuc = 66 +
          (userData.currentWeight * 13.7) +
          (userData.currentHeight * 5) -
          (userData.currentAge * 6.8);
    }
    if (userData.currentButton == 'KADIN') {
      bmhSonuc = 655 +
          (userData.currentWeight * 9.6) +
          (userData.currentHeight * 1.8) -
          (userData.currentAge * 4.7);
    }

    switch (userData.selectedItem) {
      case 'Egzersiz yok':
        {
          calSonuc = bmhSonuc * 1.2;
        }
        break;
      case 'Hafif iş - egzersiz':
        {
          calSonuc = bmhSonuc * 1.375;
        }
        break;
      case 'Orta yoğunlukta egzersiz':
        {
          calSonuc = bmhSonuc * 1.55;
        }
        break;
      case 'Ağır egzersiz':
        {
          calSonuc = bmhSonuc * 1.725;
        }
        break;
      case 'Çok ağır egzersiz':
        {
          calSonuc = bmhSonuc * 1.9;
        }
        break;
    }
    return calSonuc;
  }
}
