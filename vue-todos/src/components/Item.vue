<template>
  <div class ="container" style="text-align: left">
    <h2>Todos List:</h2>
      <ul>
        <li>
          <p>{{todo.id}} : <strong>{{todo.title}}</strong></p>
        </li>
      </ul>
  </div>
</template>
<script>
export default {
  props: ['todo']
}
</script>
