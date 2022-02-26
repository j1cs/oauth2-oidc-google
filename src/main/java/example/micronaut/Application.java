package example.micronaut;

import io.micronaut.core.annotation.TypeHint;
import io.micronaut.runtime.Micronaut;

@TypeHint(typeNames = {
        "com.fasterxml.jackson.databind.PropertyNamingStrategy$SnakeCaseStrategy"
})
public class Application {

    public static void main(String[] args) {
        Micronaut.run(Application.class, args);
    }
}
