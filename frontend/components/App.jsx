import React from "react";
import GreetingContainer from "./greeting_container";
import { Route } from 'react-router-dom';
import SignupFormContainer from "./signup_form_container";
import LoginFormContainer from "./login_form_container";
import SplashContainer from "./splash_container";

const App = () => (
    <div>
        <header>
        </header>     
        <Route path="/signup" component={SignupFormContainer} />
        <Route path="/login" component={LoginFormContainer} />
        <Route exact path="/main" component={GreetingContainer} /> 
        {/* need greetingcontainer to render in Header when logged in. 
        This will become main feed. */}
        <Route exact path="/" component={SplashContainer} />
    </div>
);

export default App;