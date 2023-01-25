package features.todos_module;

import com.intuit.karate.junit5.Karate;

class TodosRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("todos").relativeTo(getClass());
    }    

}
