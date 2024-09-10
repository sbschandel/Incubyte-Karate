package org.example;

import com.intuit.karate.junit5.Karate;

class KarateRunnerTest {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run().tags("~@ignore").relativeTo(getClass());
    }

}
