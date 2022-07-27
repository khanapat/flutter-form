void main() {
  const double netSalary = 10000;
  const double expenses = 2300;

  if (netSalary > expenses) {
    print('You have saved ${netSalary - expenses} this month');
  } else if (expenses > netSalary) {
    print('You have lost ${expenses - netSalary} this month');
  } else {
    print("Your balance hasn't changed");
  }
}