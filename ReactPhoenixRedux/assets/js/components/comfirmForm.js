import React from 'react'
import useForm from 'react-hook-form'
import {Link} from "react-router-dom";
import {connect} from "react-redux";

function ConfirmForm(props) {
    const { register, handleSubmit, watch, errors } = useForm()
    const onSubmit = data => { console.log(data) }

    // console.log(watch('example')) // watch input value by passing the name of it

    return (
        <div>
            <form >
                <label>Last Name:</label>
                { props.page04.member.last_name }
                <input type="hidden" name="last_name"/>
                <label>First Name:</label>
                { props.page04.member.first_name }
                <input type="hidden" name="first_name"/>
                <label>Email:</label>
                { props.page04.member.email }
                <input type="hidden" name="email"/>
                <label>Password:</label>
                { props.page04.member.passwd }
                <input type="hidden" name="passwd"/>
                <br/>
                <input type="submit" value="更新"/>
            </form>
            <Link to={"/"}>戻る</Link>
        </div>
    );
}

export default connect((state)=>state)(ConfirmForm);
