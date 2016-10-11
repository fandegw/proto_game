part of proto_game.text;


class Text {

  List<dynamic> whole = new List();

  Text.fromString(String text){
    TextDecodingHelper.decompose(text, _addPart);
  }

  _addPart(var part){
    if (part is ElseText){
      if (!whole.any((var line) => line is IfText)){
        print("no 'if' statement before else statement, will not parse else statement");
        return;
      }
    }
    whole.add(part);
  }

  String getWholeText(){
    String wholeText = "";
    bool lastIfResult;
    for (var element in whole) {
      if (element is String)
        wholeText += element + r"\n";
      else if (element is IfText) {
        lastIfResult = element.condition.isConditionTrue(null);
        if (lastIfResult) wholeText += element.text + r"\n";
      }
      else if (element is ElseText) {
        if (!lastIfResult) wholeText += element.text + r"\n";
      } else if (element is List) {
        for (var subElement in element) {
          if (subElement is String)
            wholeText += subElement;
          else if (subElement is HasValue)
            wholeText += subElement.getValue();
          else
            wholeText += subElement;
        }
      }
    }
    return wholeText;
  }

}