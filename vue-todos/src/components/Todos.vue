<template>
  <div class ="container" style="text-align: left">
    <h2>Todos List:</h2>
    <Item
      v-for="(todo,index) in todos"
      v-bind:todo="todo"
      v-bind:key="index"
    />
    <h2>Add new todo: </h2>
    <add-todo></add-todo>
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
  }
}
</script>
