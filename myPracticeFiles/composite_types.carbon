package ExplorerTest api;

fn UseTuples() {
    var x: (i32, i32, i32, String) = (0, 1, 2, "omega");
    Print("At index 2: {0}", x[2]);
    Print(x[3]);
}

// Use Struct types to identify members by name rather than index
fn UseStruct() {
    var data: auto = {.x = 3, .b = 2, .m_slope = 7};
    var y: i32 = data.m_slope * data.x + data.b;
    Print("y: {0}", y);
}

fn Pointers() {
  var x: i32 = 0;
  Print("Initial x: {0}", x);
  
  x = 10;  // changes x to 10
  Print("x is now {0}", x);
  
  var y: i32* = &x;  // returns pointer to x
  
  *y = 5;  // changes x to 5
  Print("x is now {0}", x);
  Print("y = {0}", *y);
}

// Classes

class Widget {
    var x: i32;
    var y: i32;
    var payload: String;

    fn Sum[me: Self]()-> i32 {
        var total: i32 = me.x + me.y;
        return total;
    }
}

fn multiStrings() {
    var singleLine: String = "Hello world!";
    var multiLine: String = """hello line 1
            this is the second line 2
            this is the third line 3 
            """;
    //End of multi block
    Print(singleLine)
    Print(multiLine)
}

fn Main() -> i32 {
  var s: auto = "Hello composite types!";
  Print(s);
  UseTuples();
  UseStruct();
  Pointers();
  var myWidget: Widget = {.x = 6, .y = 11, .payload = "load"};
  var total: i32 = myWidget.Sum();
  Print("Total sum {0}" , total);
  multiStrings()
  return 0;
}

