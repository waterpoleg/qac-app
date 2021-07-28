const Loader = () => {
    const url = `http://localhost:5000/swagger/v1/swagger.json`;
    const url2 = `http://jsonplaceholder.typicode.com/posts`;

    fetch(url2)//, {mode: 'no-cors'}
        .then(response => {
            return response.json();
        })
        .then(json => {
            console.log(json);
        })

    return (
        <div>
            Check console...
        </div>
    )
}

export default Loader;

