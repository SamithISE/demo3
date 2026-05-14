package samith.sam_loverboy;

import java.io.FileReader;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Reader {
    public static void main(String[] args) {
        try {
            JSONParser parser = new JSONParser();

            Object obj = parser.parse(new FileReader("demo.json"));

            JSONObject jsonObject = (JSONObject) obj;

            String fname = (String) jsonObject.get("fname");
            String lname = (String) jsonObject.get("lname");

            System.out.println("First Name: " + fname);
            System.out.println("Last Name: " + lname);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
