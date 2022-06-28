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
        else return attribute + symbol + "'" + URLEncoder.encode(value, StandardCharsets.UTF_8) + "'";
    }

    public static String toName(String En) {
        return switch (En) {
            case "id" -> "编号";
            case "dateTime" -> "时间";
            case "storeName" -> "储存库点";
            case "shelfNo" -> "货架编号";
            case "variety" -> "种类";
            case "moistureAndVolatiles" -> "水分及挥发物";
            case "insolubleImpurity" -> "不溶性杂质";
            case "solventResidue" -> "溶剂残留量";
            case "acidValue" -> "酸值";
            case "peroxideValue" -> "过氧化值";
            default -> "null";
        };
    }

    public static String toUnit(String En) {
        return switch (En) {
            case "id" -> "";
            case "dateTime" -> "";
            case "storeName" -> "";
            case "shelfNo" -> "";
            case "variety" -> "";
            case "moistureAndVolatiles" -> "(%)";
            case "insolubleImpurity" -> "(%)";
            case "solventResidue" -> "溶剂残留量(mg/kg)";
            case "acidValue" -> "酸值(mg/g)";
            case "peroxideValue" -> "过氧化值mmol/kg)";
            default -> "null";
        };
    }

    public static String toType(String en) {
        return switch (en) {
            case "avg" -> "平均值";
            case "sum" -> "总计";
            case "count" -> "计数";
            default -> "null";
        };
    }

}
