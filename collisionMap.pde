import java.util.HashMap;
import java.util.Set;
import processing.data.JSONObject;

HashMap<String, Line> lines = new HashMap<String, Line>();
JSONObject json;

void mapper() {
  json = loadJSONObject("collision_map.json");
  Set<String> keysSet = json.keys();
  String[] keys = keysSet.toArray(new String[keysSet.size()]);

  for (int i = 0; i < json.size(); i++) {
    JSONObject lineJson = json.getJSONObject(keys[i]);
    int direction = lineJson.getInt("direction");
    String orientation = lineJson.getString("dentro");
    int startX = lineJson.getInt("startX");
    int startY = lineJson.getInt("startY");
    int endX = lineJson.getInt("endX");
    int endY = lineJson.getInt("endY");

    Line line = new Line(direction, orientation, startX, startY, endX, endY);

    String key = "line" + i;
    lines.put(key, line);
  }


}
