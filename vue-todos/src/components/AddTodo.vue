<template>
  <div id='todo'>
  <div class="container">
    <div class="content-container">
      <form v-on:submit.prevent='createTodo'>
        <label for='title'>Title</label>
        <input v-model='title' type='text' pattern=".{1,10}" required title="1 to 10 characters">
        <input v-model='created_by' type='text' pattern=".{1,10}" required title="1 to 10 characters">
        <button type="submit" class='login'>submit</button>
      </form>
    </div>
  </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'AddTodo',
  data () {
    return {
      title: '',
      created_by: ''
    }
  },
  methods: {
    createTodo: function () {
      this.$emit("create-todo", this.title, this.created_by);
      this.title = "";
      this.created_by = "";
    }
  },
}
</script>