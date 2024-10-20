class BankAccount {
    final int accountId;
    final String accountName;
    double _balance;

    BankAccount(this.accountId, this.accountName, this._balance);

    double get balance => _balance;  //check balance 

    // withdraw amount from balance
    double withdraw(double amount){
      if(amount > 0){
        if(_balance >= amount){
          _balance = _balance - amount;
          return _balance;
        }else{
          throw new Exception("Insufficient balance for withdraw!");
        }
      }
      else{
        throw new Exception("Invalid withdraw amount!");
      }
    }

    // credit 
    double credit(double amount){
      if(amount > 0){
        _balance += amount;
        return _balance;
      }
      else{
        throw new Exception("Invalid credit amount!");
      }
    }

    @override 
    String toString(){
      return 
        """ 

        ====================== Account =======================
        || Account ID: $accountId
        || Account Name: $accountName
        || Balance: \$${balance}
        ======================================================
        """;
    }
}

// Bank 
class Bank {
  final String bankName;
  final List<BankAccount> _accounts = [];
  
  Bank({required this.bankName});

  // create acccount and handle the  unique id
  BankAccount createAccount(int accountId, String accountOwner){
    for(var account in _accounts){
      if(account.accountId == accountId){
        throw new Exception("Account with ID $accountId already exists!");
      }
    }
    var newAccount = BankAccount(accountId, accountOwner, 0);
    _accounts.add(newAccount);
    return newAccount;
  }
  
  @override
  String toString(){
    return 
      """ 
      
        ======================= Bank ==========================
        || Bank Name: $bankName
        || Number of Accounts: ${_accounts.length}
        || Accounts: ${_accounts.map((a) => a.accountName.length > 0 ? a.accountName : 'No account found')}
        =======================================================
      """;
  }

}
 
void main() {
  Bank myBank = Bank(bankName: "Saiya Bank");
  print(myBank); 

  BankAccount ronanAccount = myBank.createAccount(001, 'Ronan');
  print(ronanAccount); 
  // Bank myBank = Bank(name: "CADT Bank");
  print("\t=================== Transaction ======================");
  print("\t|| Check Balance: \$${ronanAccount.balance}"); // Balance: $0
  ronanAccount.credit(100);
  print("\t|| Credit: \$100");
  print("\t|| Check Balance: ${ronanAccount.balance}"); // Balance: $100
  ronanAccount.withdraw(20);
  print("\t|| Withdraw: \$20");
  print("\t|| Check Balance: \$${ronanAccount.balance}"); // Balance: $80
  print("\t|| Withdraw: \$85");   // withdraw more than balance have 
  try {
    ronanAccount.withdraw(85); // This will throw an exception
  } catch (e) {
    print("\t|| ${e}"); // Output: Insufficient balance for withdrawal!
  }
  print('\t|| Create a new account with existing ID');

  try {
    myBank.createAccount(001, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print("\t|| ${e}");
  }

  // create one more account name Satya
  try {
    myBank.createAccount(002, 'Satya');
  } catch (e){
    print("\t|| ${e}"); 
  }
  print("\t======================================================");
  print(ronanAccount); 
  print(myBank);
}
