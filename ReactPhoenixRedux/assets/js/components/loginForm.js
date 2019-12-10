import React  from 'react'
import { connect } from "react-redux";
import useForm from 'react-hook-form'
import {Link} from "react-router-dom";
import { login } from "../actions/loginAction";

function LoginForm(props) {
    const { register, handleSubmit, watch, errors } = useForm();
    const onSubmit = data => {
        let email = data.email
        let passwd = data.passwd;
        login(props, email, passwd);
    };

    return (
        <div>
            <form onSubmit={handleSubmit(onSubmit)}>
                <label>Email:</label>
                <input type="text" name="email" ref={register}/>
                <label>Password:</label>
                <input type="text" name="passwd" ref={register}/>
                <input type="submit" value="ログイン"/>
            </form>
            <Link to={"/"}>戻る</Link>
        </div>
    );
}
export default connect((state)=>state)(LoginForm);
