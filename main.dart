import 'dart:io';

void main() {
  double total = 0.0;

  while (true) {
    print('===== Restaurant =====');
    print('----Menu Option-----\n');
    print('1. Coffee  - \$1.50');
    print('2. Noodles - \$2.00');
    print('3. Rice    - \$2.50');
    print('4. Pay');
    stdout.write('Choose: ');
    String? choice = stdin.readLineSync();
    choice = choice?.replaceAll('\uFEFF', '').replaceAll('ï»¿', '').trim();

    if (choice == '1' || choice == '2' || choice == '3') {
      String itemName = '';
      double price = 0.0;

      if (choice == '1') {
        itemName = 'Coffee';
        price = 1.50;
      } else if (choice == '2') {
        itemName = 'Noodles';
        price = 2.00;
      } else if (choice == '3') {
        itemName = 'Rice';
        price = 2.50;
      }

      int quantity = 0;
      while (true) {
        stdout.write('How many? ');
        String? qtyInput = stdin.readLineSync()?.trim();
        int? parsed = int.tryParse(qtyInput ?? '');

        if (parsed != null && parsed > 0) {
          quantity = parsed;
          break;
        } else {
          print('Invalid amount. Try again.');
        }
      }

      total += price * quantity;
      print('Added $quantity x $itemName. Total: \$${total.toStringAsFixed(2)}\n');
    } else if (choice == '4') {
      if (total == 0.0) {
        print('Your order is empty\n');
      } else {
        print('Total to pay: \$${total.toStringAsFixed(2)}');
        stdout.write('Money given (\$): ');
        String? moneyInput = stdin.readLineSync()?.trim();
        double? money = double.tryParse(moneyInput ?? '');

        if (money != null && money >= total) {
          double change = money - total;
          print('Change: \$${change.toStringAsFixed(2)}');
          print('Thank you');
          break;
        } else {
          print('Not enough money. Order kept.\n');
        }
      }
    } else {
      print('Invalid choice\n');
    }
  }
}
