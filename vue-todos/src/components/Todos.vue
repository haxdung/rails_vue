<template>
  <div class ="container" style="text-align: left">
    <div class="list-info">
      <p><strong>Completed Tasks:</strong> {{ todos.filter(todo => { return todo.status == 'done' }).length }}</p>
      <p><strong>Pending Tasks:</strong> {{ todos.filter(todo => { return todo.status == 'pending' }).length }}</p>
    </div>

    <h2>Add new todo: </h2>
    <AddTodo v-on:create-todo="CreateTodo" />

    <h2>Todos List:</h2>
    <Item
      v-on:complete-todo="completeTodo"
      v-on:delete-todo="deleteTodo"
      v-on:update-todo="updateTodo"
      v-for="(todo,index) in todos"
      v-bind:todo="todo"
      v-bind:key="index"
    />
  </div>
</template>
<script>
import axios from 'axios';
import AddTodo from './AddTodo';
import Item from './Item';

export default {
  components: {
    AddTodo,
    Item
  },
  data () {
    return {
      todos: [],
    }
  },
  created () {
    axios.get('http://127.0.0.1:3000/todos')
      .then(response => {
        this.todos = response.data
      })
  },
  methods: {
    deleteTodo(todo) {
      const index = this.todos.indexOf(todo);
      axios.delete('http://127.0.0.1:3000/todos/' + todo.id)
        .then(response => {
          this.todos.splice(index, 1)
        });
    },
    updateTodo(todo) {
      // axios.put('http://127.0.0.1:3000/todos/' + todo.id)
      //   .then(response => {
      //     id: this.todo.id,
      //     title: this.todo.title,
      //     created_by: this.todo.created_by
      //   })
      
      
      // axios({
      //   method: 'put',
      //   url: 'http://127.0.0.1:3000/todos/' + todo.id,
      //   data: {
      //     id: todo.id,
      //     title: todo.title,
      //     created_by: todo.created_by
      //   }
      // }).then(response => {
      //   console.log(response);
      //   this.initialize();
      // })

      axios
        .put(`http://127.0.0.1:3000/todos/${todo.id}`, {
          id: todo.id,
          title: todo.title,
          created_by: todo.created_by
        })
        .then(response => {
        console.log(response);
        // this.todos = response.data;
        })
        .catch(error => {
        console.log(error);
      });
    },
    CreateTodo(title, created_by){
      axios.post('http://localhost:3000/todos', { 
            title: title,
            created_by: created_by 
          })
          .then(response => {
            // // this.todos.push(response.data);
            // console.log(this.todos)
            // console.log(response.data)
            this.todos.push(response.data);
          })
          .catch(function(error){
            console.log(error);
          });
    },
    completeTodo(todo) {
      axios
        .put(`http://localhost:3000/todos/${todo.id}/update_status`, {
          id: todo.id
        })
        .then(response => {
          console.log(response);
          todo.status = response.data.status;
        })
        .catch(error => {
        console.log(error);
      });
    }
  }
}
</script>
