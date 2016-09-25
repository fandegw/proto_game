part of proto_game.npc;


class Npc {

  String name;

  Map<String, BaseProperty> properties = new Map();

  List<BaseGameObject> inventory = new List();

  List<WearableGameObject> wearing = new List();

  List<NpcInteraction> interactions = new List();

  BaseProperty getProperty(String name){
    if (properties[name] == null){
      print("Wrong name, property $name does not exist");
      return null;
    }
    return new ModifiedProperty(properties[name], wearing);
  }

}