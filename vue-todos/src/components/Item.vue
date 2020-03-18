<template>
  <div class ="container" style="text-align: left">
    <div class="content" v-show="!isEditing">
      <ul>
        <p>{{todo.id}} </p>
        <p>Title: <strong>{{todo.title}}</strong></p>
        <p>Created by: <strong>{{todo.created_by}}</strong></p>
        <p>Status: <strong>{{todo.status}}</strong></p>
      </ul>
      <ul>
        <span class=" floatd edit icon">
          <button v-on:click="showForm">edit</button>
        </span>
        <span class=" floatd trash icon">
          <button v-on:click="deleteTodo(todo)">delete</button>
        </span>
      </ul>
      <ul>
        <div class="ui bottom attached green basic button" v-show="!isEditing && todo.status=='done'" disabled>
          Completed
        </div>
        <button class="ui bottom attached red basic button" v-show="!isEditing && todo.status=='pending'" v-on:click="completeTodo(todo)">
          Pending
        </button>
      </ul>
    </div>
    <div class="form_edit" v-show="isEditing">
      <div class="ui form">
        <div class="field">
          <label for="">Title</label>
          <input type="text" v-model="todo.title" pattern=".{1,11}" required title="1 to 10 characters">
        </div>
        <div class="field">
          <label for="">created by</label>
          <input type="text" v-model="todo.created_by" pattern=".{1,11}" required title="1 to 10 characters">
        </div>
        <div class="">
          <button class="" v-on:click="updateTodo(todo)">
            update & close
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: ['todo'],
  data() {
    return {
      isEditing: false
    };
  },
  methods: {
    showForm() {
      this.isEditing = true;
    },
    deleteTodo(todo) {
      this.$emit("delete-todo", todo);
    },
    updateTodo(todo) {
      this.isEditing = false;
      this.$emit("update-todo", todo);
    },
    completeTodo(todo) {
      this.$emit("complete-todo", todo);
    }
  }
}
</script>
