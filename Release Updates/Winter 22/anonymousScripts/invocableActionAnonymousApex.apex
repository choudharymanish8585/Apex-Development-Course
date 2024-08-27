Invocable.Action action = Invocable.Action.createStandardAction('chatterPost');
action.setInvocationParameter('text', 'This is a test.');
action.setInvocationParameter('type', 'User');
action.setInvocationParameter('subjectNameOrId', UserInfo.getUserId());
List<Invocable.Action.Result> results = action.invoke();
if (results.size() > 0 && results[0].isSuccess()) {
    System.debug(
        'Created feed item with ID: ' +
        results[0].getOutputParameters().get('feedItemId')
    );
}
