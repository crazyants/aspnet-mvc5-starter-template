﻿using Serilog.Formatting;
using Serilog.Events;
using System.IO;
using Sarto.Extensions;

namespace App.UI.Mvc5.Infrastructure
{
	public class SerilogTextFormatter : ITextFormatter
	{
		public void Format(LogEvent logEvent, TextWriter output)
		{
			output.WriteLine($"[{logEvent.Level.ToUpperCaseString()}] [{logEvent.Timestamp}] {logEvent.RenderMessage()}");
			output.WriteLine();

			foreach (var prop in logEvent.Properties)
			{
				output.WriteLine($" - {prop.Key}: {prop.Value}");
			}

			if (logEvent.Exception != null)
			{
				output.WriteLine();
				output.WriteLine($" - {logEvent.Exception}");
			}

			output.WriteLine();
			output.WriteLine("-------------------------------------------------------");
			output.WriteLine();
		}
	}
}
