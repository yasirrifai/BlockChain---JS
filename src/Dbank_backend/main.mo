import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var moneyvalue:Float = 100;
  moneyvalue:= 200;

  stable var startTime = Time.now();
  startTime:= Time.now();
  //Debug.print(debug_show(moneyvalue));

  public func deposit(amount: Float){
    moneyvalue += amount;
     Debug.print(debug_show(moneyvalue));
  };

  
  public func withdraw(amount: Float){
    let tempValue: Float = moneyvalue-amount;
    if(tempValue >= 0)
    {
      moneyvalue -= amount;
    Debug.print(debug_show(moneyvalue));
    }
    else {
      Debug.print("Insufficient bank balance");
    }
    
  };

  public func compound(){
    let newTime = Time.now();
    let newTimeDurationNS = newTime - startTime;
    let newTimeDurationS = newTimeDurationNS / 10 ** 9;
    moneyvalue:= moneyvalue * (1.01 ** Float.fromInt(newTimeDurationS));
    startTime:= newTime;
  };

  public query func balance(): async Float {
    return moneyvalue;
  };
 
};
