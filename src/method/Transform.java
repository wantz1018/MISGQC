package method;

import javax.sound.sampled.AudioFormat;
import java.beans.Encoder;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Objects;

public class Transform {
    public static String toExpression(String attribute, String translate, String value) throws UnsupportedEncodingException {

        String symbol = null;
        switch (translate) {
            case "equal" -> symbol = " = ";
            case "unequal" -> symbol = " != ";
            case "bigger" -> symbol = " > ";
            case "smaller" -> symbol = " < ";
            case "notBigger" -> symbol = " <= ";
            case "notSmaller" -> symbol = " >= ";
            case "include" -> symbol = "%20like%20";
            case "notInclude" -> symbol = "%20not%20like%20";
        }
        if (Objects.equals(symbol, "%20like%20") || Objects.equals(symbol, "%20not%20like%20")) return attribute + symbol + "'%25" + URLEncoder.encode(value, StandardCharsets.UTF_8) + "%25'";
        else return attribute + symbol + URLEncoder.encode(value, StandardCharsets.UTF_8);
    }

}
