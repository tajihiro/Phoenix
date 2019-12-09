import React  from 'react'
import { connect } from "react-redux";
import useForm from 'react-hook-form'
import {Link} from "react-router-dom";

function InputForm(props) {
    const { register, handleSubmit, watch, errors } = useForm();
    const onSubmit = data => {
        // console.log(data);
        props.dispatch({type: 'CONFIRM', params: data});
    };

    return (
        <div>
            <form onSubmit={handleSubmit(onSubmit)}>
                <label>Last Name:</label>
                <input type="text" name="last_name" ref={register}/>
                <label>First Name:</label>
                <input type="text" name="first_name" ref={register}/>
                <label>Email:</label>
                <input type="text" name="email" ref={register}/>
                <label>Password:</label>
                <input type="text" name="passwd" ref={register}/>
                <input type="submit" value="更新"/>
            </form>
            <Link to={"/"}>戻る</Link>
        </div>
    );
}
export default connect((state)=>state)(InputForm);
