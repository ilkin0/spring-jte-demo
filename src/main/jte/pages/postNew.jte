@import com.ilkinmehdiyev.springjteblogapp.Post

@param Post post
@param String action
@param String submitButtonText


@template.layout.main(
title = post.getTitle(),
content = @`
<form action="${action}" method="POST" class="space-y-6">
    <div>
        <label for="title" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Title</label>
        <input type="text" name="title" id="title" required
               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50 dark:bg-gray-700 dark:border-gray-600 dark:text-white"
               value="${post.getTitle()}">
    </div>

    <div>
        <label for="author" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Author</label>
        <input type="text" name="author" id="author" required
               class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50 dark:bg-gray-700 dark:border-gray-600 dark:text-white"
               value="${post.getAuthor()}">
    </div>

    <div>
        <label for="summary" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Summary</label>
        <textarea name="summary" id="summary" rows="3"
                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50 dark:bg-gray-700 dark:border-gray-600 dark:text-white">${post.getSummary()}</textarea>
    </div>

    <div>
        <label for="content" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Content</label>
        <textarea name="content" id="content" rows="10" required
                  class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-blue-300 focus:ring focus:ring-blue-200 focus:ring-opacity-50 dark:bg-gray-700 dark:border-gray-600 dark:text-white">${post.getContent()}</textarea>
    </div>

    <div>
        <button type="submit"
                class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
            Create
        </button>
    </div>
</form>
`
)