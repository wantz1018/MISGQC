package method;

import java.util.Objects;

public class Transform {
    public static String toExpression(String attribute, String translate, String value) {
        String symbol = null;
        switch (translate) {
            case "equal" -> symbol = " = ";
            case "unequal" -> symbol = " != ";
            case "bigger" -> symbol = " > ";
            case "smaller" -> symbol = " < ";
            case "notBigger" -> symbol = " <= ";
            case "notSmaller" -> symbol = " >= ";
            case "include" -> symbol = " like ";
            case "notInclude" -> symbol = " not like ";
        }
        if (Objects.equals(symbol, " like ") || Objects.equals(symbol, " not like ")) return attribute + symbol + "'%25" + value + "%25'";
        else return attribute + symbol + value;
    }

}
